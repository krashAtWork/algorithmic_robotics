function[errorArray] = sample_error(ut, alp)

errorArray = [0; 0; 0;];
v = ut(1);
w = ut(2);
vcpE = sample(v, w, alp(1), alp(2));
wcpE = sample(v, w, alp(3), alp(4));
ycpE =  sample(v, w, alp(5), alp(6));
errorArray(1,1)= vcpE;
errorArray(2,1)= wcpE;
errorArray(3,1)= ycpE;

end