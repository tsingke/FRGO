function [gbestX,gbestfitness,gbesthistory]= FRGO(N,D,ub,lb,MaxFEs,Func,FuncId)
%initialization
FEs=0;
X=lb+(ub-lb)*rand(N,D);
B=rand(N,D);
NB=rand(N,D);
KA=rand(N,D);
fit=inf(N,1);
newfit=fit;
gbestfitness=inf;
gbesthistory=inf(1,MaxFEs);
fit=(Func(X',FuncId));
FEs=FEs+N;
[minfitness,minindex]=min(fit);
if gbestfitness>=minfitness
    gbestfitness=minfitness;
    gbestX=X(minindex,:);
end
gbesthistory(1:FEs)=gbestfitness;
Z1=zeros(4,1);Z2=zeros(4,D);Z3=ones(D,1);
while 1
    % Population hierarchy
    pd=round(1+(N*0.5-2)*rand*(1-FEs/MaxFEs));
    cr=0.3*rand(N,D);
    [~,ind]=sort(fit);
    worse_index=ind(randi([N-pd+1,N],1,N));
    normal_index=ind(randi([pd+1,N-pd],1,N));
    better_index=ind(randi([1,pd],1,N));
    nobetter_index=ind(randi([pd+1,N],1,N));
    Worse_X=X(worse_index,:);
    Normal_X=X(normal_index,:);
    Better_X=X(better_index,:);
    NoBetter_X=X(nobetter_index,:);
    % Learning operator with flexible reshuffling
    maxfit=max(fit);
    for i=1:N
        K=randperm(4,ceil(rand*4))';
        NK=length(K);
        Distance=Z1;Gap=Z2;
        for Kn=1:NK
            k=K(Kn);
            if k==1
                Gap(1,:)=(Better_X(i,:)-NoBetter_X(i,:));
                Distance(1)=((Gap(1,:).^2)*Z3)^0.5;  
            elseif k==2
                Gap(2,:)=(Normal_X(i,:)-Worse_X(i,:));
                Distance(2)=((Gap(2,:).^2)*Z3)^0.5;
             elseif k==3
                r=randperm(N,2);
                L1=r(1);
                L2=r(2);
                Gap(3,:)=(X(L1,:)-X(L2,:));
                Distance(3)=((Gap(3,:).^2)*Z3)^0.5;
            else
                r=randperm(N,2);
                L3=r(1);
                L4=r(2);
                Gap(4,:)=(X(L3,:)-X(L4,:));
                Distance(4)=((Gap(4,:).^2)*Z3)^0.5;
            end
        end
        SF=fit(i)/maxfit;
        LF=Distance./(Distance(1)+Distance(2)+Distance(3)+Distance(4));
        KA(i,:)=SF*(LF(1)*Gap(1,:)+LF(2)*Gap(2,:)+LF(3)*Gap(3,:)+LF(4)*Gap(4,:));
    end
    newx=X+KA;
    %Boundary constraint
    flagub=newx>ub;
    flaglb=newx<lb;
    flag=(flagub+flaglb);
    newx=(newx.*(~flag))+(lb+(ub-lb)*rand(N,D)).*flag;
    newfit=Func(newx',FuncId);
    %Selection
    II=(fit>=newfit);
    fit(II)=newfit(II);
    X(II,:)=newx(II,:);
    [minfitness,minindex]=min(fit);
    if gbestfitness>=minfitness
        gbestfitness=minfitness;
        gbestX=X(minindex,:);
    end
    FEs=FEs+N;
    gbesthistory(FEs-N+1:FEs)=gbestfitness;
    if FEs>=MaxFEs
        break;
    end
    
    %Reflection operator with distribution differences
    R1=rand(N,D);
    R2=rand(N,D);
    I1=(R1<cr)&(((MaxFEs-FEs)/(100*MaxFEs))<R2);
    I2=(R1<cr)&(~(((MaxFEs-FEs)/(100*MaxFEs))<R2));
    index1=ind(randi([1,pd],N,D));
    index2=ind(randi([pd+1,N],N,D));
    for i=1:N
        for j=1:D
            B(i,j)=X(index1(i,j),j);
            NB(i,j)=X(index2(i,j),j);
        end
    end
    EB=mean(B)+std(B).*randn(N,D);
    ENB=mean(NB)+std(NB).*randn(N,D);
    EX=mean(X)+std(X).*randn(N,D);
    newx=X;
    R3=rand(N,D);
    newx(I1)=EX(I1)+R3(I1).*(EB(I1)+ENB(I1)-2*EX(I1));
    R4=lb+(ub-lb)*rand(N,D);
    newx(I2)=R4(I2);
    %Boundary constraint
    flagub=newx>ub;
    flaglb=newx<lb;
    flag=(flagub+flaglb);
    newx=(newx.*(~flag))+(lb+(ub-lb)*rand(N,D)).*flag;
    newfit=Func(newx',FuncId);
    %Selection
    II=fit>=newfit;
    fit(II)=newfit(II);
    X(II,:)=newx(II,:);
    [minfitness,minindex]=min(fit);
    if gbestfitness>=minfitness
        gbestfitness=minfitness;
        gbestX=X(minindex,:);
    end
    FEs=FEs+N;
    gbesthistory(FEs-N+1:FEs)=gbestfitness;
    fprintf("FRGO, FEs: %d, fitess error = %e\n",FEs,gbestfitness);
    if FEs>=MaxFEs
        break;
    end
end
gbesthistory=gbesthistory(1:MaxFEs);
end