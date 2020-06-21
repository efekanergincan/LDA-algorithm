%noktalar alýnýr.
clear;
C1_1=[3 4 2.7 3.8];
C1_2=[2 3.5 4 3];
scatter(C1_1,C1_2,'O')
grid on
axis([-1 10 -1 10]);
hold on;
C2_1=[4 5 6 7];
C2_2=[4 4.5 5.5 6.1];
scatter(C2_1,C2_2,'+')
%her noktanýn x1 ve x2 lerinin ortalamasý alýnýr.
C1_1_ort=sum(C1_1)/length(C1_1);
C1_2_ort=sum(C1_2)/length(C1_2);
C2_1_ort=sum(C2_1)/length(C2_1);
C2_2_ort=sum(C2_2)/length(C2_2);
C1_ort=[C1_1_ort;C1_2_ort];
C2_ort=[C2_1_ort;C2_2_ort];
legend

%ortalamalar kendilerine ait noktadan çýkarýlýr.
for i=1:length(C1_1)
   E(i)=C1_1(1,i)-C1_1_ort;
   F(i)=C1_2(1,i)-C1_2_ort;
end
for k=1:length(C2_1)
   G(k)=C2_1(1,k)-C2_1_ort;
   H(k)=C2_2(1,k)-C2_2_ort;
end
%formüle göre çarpma iþlemi burada yapýlmýþtýr.
for j=1:length(C1_1)
a(j)=(E(j)*E(j))/(length(C1_1)-1);
b(j)=(E(j)*F(j))/(length(C1_1)-1);
c(j)=b(j);
d(j)=(F(j)*F(j))/(length(C1_1)-1);
end
for l=1:length(C2_1)
e(l)=(G(l)*G(l))/(length(C2_1)-1);
f(l)=(G(l)*H(l))/(length(C2_1)-1);
g(l)=f(l);
h(l)=(H(l)*H(l))/(length(C2_1)-1);
end
a1=sum(a); b1=sum(b); c1=sum(c); d1=sum(d); e1=sum(e); f1=sum(f);
g1=sum(g);
h1=sum(h);
S1=[a1 b1; c1 d1];
S2=[e1 f1;g1 h1];
N1=length(C1_1);
N2=length(C2_1);
S=[1/(N1+N2-2)*[(N1-1)*S1+(N2-1)*S2]];
b=(inv(S))*(C1_ort-C2_ort);
m=b(2)/b(1);
x=-2:0.001:20;
y=m*x;
axis([-1 10 -1 10])
plot(x,y,'m')





