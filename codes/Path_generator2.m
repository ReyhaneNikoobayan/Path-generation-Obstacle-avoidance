function P=Path_generator2(xs,xf,eta,B)
    X=xs;
    n=size(B,2);  %number of obstacle
    k=0.1;
    P=xs;
    gam=1;
    while norm(X-xf)>0.1
        gam=gam+1  ;
        Fatt=-eta*(X-xf);
        F=0;
        for i=1:n
            j=size(B{i},2)-2; % number of edge
            min=1000;
            efd=B{i}{1};
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
              T=inv(D)*(X-C);
              alpha=T(1); 
              if alpha<0
                 H=C;
              elseif alpha>1
                 H=A;
              else
                 H=alpha*(A-C)+C;
              end    
              d=norm(X-H);
              if d<min
                 h=H;
                 min=d;
              end    
            end
            if min<efd
              Fnep=B{i}{2}*(min)^(-3)*((1/min)-(1/efd))*(X-h);
            else
              Fnep=0;
            end
            F=F+Fnep;
        end
        Ftot=F+Fatt;
        Fd=Ftot/norm(Ftot);
        next_step=0.1*Fd+X;
        P=cat(2,P,next_step);
        e=gam-2;
        if e>2
         if next_step==P(:,e) 
             Q=Random_walk(xs,xf,eta,B,P);
             P=cat(2,P,Q);
             X=P(:,size(P,2));
             continue
         end   
        end 
        X=next_step;
        
    end
end