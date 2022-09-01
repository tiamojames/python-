clc, clear
%% ================= Simulation of LODCO Algorithm =================

%% ������������
k = 1e-28;                        % ��Ч���ص���
tau = 0.002;                      % ʱ��Ƭ����(s)
tau_d = 0.002;                    % ��������ִ��ʱ���deadline(s)
phi = 0.002;                      % �������ĳͷ���Ȩ��(s)
omega = 1e6;                      % ����������(Hz)
sigma = 1e-13;                    % ���ն˵���������(W)
p_tx_max = 1;                     % �ƶ��豸����书��(W)
f_max = 1.5e9;                    % �ƶ��豸���CPUʱ������Ƶ��(Hz)
E_max = 0.002;                    % �����������ŵ���(J)
L = 1000;                         % һ���������Ĵ�С(bit)
X = 737.5;                        % �ƶ��豸ִ��1bit���������ʱ�����ڸ���
W = L*X;                          % �ƶ��豸����ִ��һ��������������ʱ�����ڸ���
E_H_max = 48e-6;                  % �ռ����������ӵľ��ȷֲ�����(J)
g0 = power(10,-4);                % ·����ʧ����(dBת��֮�����ֵ��)
d = 50;                           % ���������ƶ��豸֮�����Ծ���(m)

%% ��������
T = 3000;                         % ʱ��Ƭ����
E_min = 0.02e-3;                  % ����ʹ���½�(J)
V = 1e-5;                         % LODCO��penalty���Ȩ��(J^2/second)
rho = 0.6;                        % ��������ִ�ĸ���

% ʵ���ܺ�����
E_max_hat = min(max(k*W*(f_max^2), p_tx_max*tau), E_max);
theta = E_max_hat + V*phi/E_min;        % �Ŷ�����


%% �м�����洢
B = zeros(T, 1);                        % ʵ�ʵ���
B_hat = zeros(T, 1);                    % �������
e = zeros(T, 1);                        % �����ռ�
indicator = zeros(T, 1);                % 1/2/3/4�ֱ��Ӧlocal,remote,dropped,���������
f = zeros(T, 1);                        % �ƶ��豸����ִ�е�Ƶ��
p = zeros(T, 1);                        % �ƶ��豸ж��ִ�еĴ��书��
cost = zeros(T, 3);                     % ÿһ�зֱ��Ӧlocal,remote,���ѡ���ģʽ�µ�execution cost
E = zeros(T, 3);                        % ÿһ�зֱ��Ӧlocal,remote,���ѡ���ģʽ�µ��ܺ�

% �ر�fslove�����
opt = optimset('Display', 'off');

t = 1;
while t <= T
    %% �׶γ�ʼ��
    % �Բ�Ŭ���ֲ�������������
    zeta = binornd(1, rho);
    % ���������������ֵ
    B_hat(t) = B(t) - theta;

    %% ���optimal energy harvesting e* (�����Ƿ�����������������ռ�������ͣ��)
    % ����E_H_t
    E_H_t = unifrnd(0, E_H_max);
    if B_hat(t) <= 0
        e(t) = E_H_t;
    end
    
    if zeta == 0
        % û�м����������
        indicator(t) = 4;
        % f(t) = 0; p(t) = 0;  Ĭ�ϼ�Ϊ0
    else
        % �����ŵ���������
        h = exprnd(g0/power(d,4));

        %% ���P_ME
        f_L = max(sqrt(E_min/(k*W)), W/tau_d);
        f_U = min(sqrt(E_max/(k*W)), f_max);
        if f_L <= f_U
            % P_ME�н�
            f0 = power(V/(-2*B_hat(t)*k), 1/3);
            if f0 > f_U
                f(t) = f_U;
            elseif f0 >= f_L && f0 <= f_U && B_hat(t) < 0
                f(t) = f0;
            elseif f0 < f_L
                f(t) = f_L;
            end
            % ����local��execution delay
            cost(t, 1) = W / f(t);
            % �����ʱ���ܺ�
            E(t, 1) = k * W * (f(t)^2);
            if E(t, 1) >= B(t)
                disp(['����ִ�е�������![��ʱtΪ', num2str(t), ']']);
                % ������������߱���ִ���������޽��ʱ�򣬽����������Ŀ�꺯��ֵ��Ϊinf
                J_m = inf;
            else
                % �����ʱ��J_m��������ִ���������Ŀ�꺯��ֵ
                J_m = -B_hat(t)*E(t,1) + V*cost(t,1);
            end

        else
            disp(['P_ME�޽�![��ʱtΪ', num2str(t), ']']);
            J_m = inf;
        end

        %% ���P_SE
        E_tmp = sigma*L*log(2) / (omega*h);
        p_L_taud = (power(2, L/(omega*tau_d)) - 1) * (sigma/h);
        if E_tmp >= E_min
            p_L = p_L_taud;
        else
            % ����p_Emin
            y = @(x)x*L-omega*log2(1+h*x/sigma)*E_min;
            %p_Emin = double(vpa(solve(y, 1)));
            tmp = fsolve(y, [0.001, 1], opt);
            p_Emin = max(tmp);
            p_L = max(p_L_taud, p_Emin);
        end
        if E_tmp >= E_max
            p_U = 0;
        else
            % ����p_Emax
            y = @(x)x*L-omega*log2(1+h*x/sigma)*E_max;
            p_Emax = max(fsolve(y, [0.001, 100]));
            p_U = min(p_tx_max, p_Emax);
        end
        if p_L <= p_U
            % P_SE�н�
            % ����p0
            tmp = B_hat(t);
            syms x
            y = tmp*log2(1+h*x/sigma) + h*(V-tmp*x)/(log(2)*(sigma+h*x));
            p0 = double(vpasolve(y));
            if p_U < p0
                p(t) = p_U;
            elseif p_L > p0 && B_hat(t) < 0
                p(t) = p_L;
            elseif p_L <= p0 && p_U >= p0 && B_hat(t) < 0
                p(t) = p0;
            end
             % ����achievable rate
            r = calAchieveRate(h, p(t), omega, sigma);
            % �����ʱ��execution delay
            cost(t, 2) = L / r;
            % �����ʱ���ܺ�
            E(t, 2) = p(t) * L / r;
            if E(t, 2) >= B(t)
                disp(['ж��ִ�е�������![��ʱtΪ', num2str(t), ']']);
                J_s = inf;
            else
                % �����ʱ��J_sж��ִ���������Ŀ�꺯��ֵ
                J_s = -B_hat(t)*E(t,2) + V*cost(t,2);
            end
        else
            disp(['P_SE�޽�![��ʱtΪ', num2str(t), ']']);
            J_s = inf;
        end

        %% ѡȡ���ģʽ
        [~, mode] = min([J_m, J_s, phi]);
        indicator(t) = mode;
    end

    % ����ʵ��ѡ���ģʽ�µ�execution cost���ܺ�
    if indicator(t) == 1
        cost(t, 3) = cost(t, 1);
        E(t, 3) = E(t, 1);
    elseif indicator(t) == 2
        cost(t, 3) = cost(t, 2);
        E(t, 3) = E(t, 2);
    % ʣ����������ܺ�Ϊ0������
    elseif indicator(t) == 3
        cost(t, 3) = phi;
    else
        % ��û��������������
        cost(t, 3) = 0;
    end
    % ��������
    B(t+1) = B(t) - E(t, 3) + e(t);
    % ʱ��Ƭ����
    t = t + 1;
end

%% results
% ���������ʱ��Ƭ����
num = T - sum(indicator == 4);
disp(['��ǰ���񵽴��Ƶ��Ϊ��', num2str(num/T)]);
mode1 = sum(indicator==1) / (num);
disp(['���񱾵�ִ�еı��ʣ�', num2str(mode1)]);
mode2 = sum(indicator==2) / (num);
disp(['����ж��ִ�еı���:', num2str(mode2)]);
mode3 = sum(indicator==3) / (num);
disp(['���������ı��ʣ�', num2str(mode3)]);