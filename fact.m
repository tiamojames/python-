function output=fact(n)
      if n==1
          output=1
      else
          output=n*fact(n-1);
      end
end