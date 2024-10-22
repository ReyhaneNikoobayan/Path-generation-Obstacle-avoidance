function Q=Random_walk(xs,xf,eta,B,P)
   y=size(P,2);
   X=P(:,y);
   n=size(B,2);
   x=xf(1)-X(1);
   z=xf(2)-X(2);
   theta=atan2d(z,x);
   Q=X;
   s=randi([2,6],1);
   for o = theta: -1 :theta-360
       
       X=P(:,y);
       Q=X;
       for q=1:(s*10)
          Next=X+0.1*[cosd(o);sind(o)];
          
          min=1000;
          for i=1:n
            j=size(B{i},2)-2; % number of edge
            for k=1:j
              if k<j
                 C=B{i}{k+2};
                 A=B{i}{k+3};
               
              else 
                 C=B{i}{k+2};
                 A=B{i}{3};
              end   
              R=-[0,-1;1,0]*(A-C);
              D=cat(2,(A-C),R);
              T=inv(D)*(Next-C);
              alpha=T(1); 
              if alpha<0
                 H=C;
              elseif alpha>1
                 H=A;
              else
                 H=alpha*(A-C)+C;
              end    
              d=norm(Next-H);
              if d<min
                 h=H;
                 min=d;
              end    
            end
          end
          if min<0.4
               break
          else
              Q=cat(2,Q,Next);
              X=Next;
              q=q+1;
          end
       end
       if q==(s*10+1)
           break
       end    
   end
         


