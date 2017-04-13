input = importdata('noisy.data');
Y = input(:, 1);
X = input(:, 2);
U = input(:, 3);
len = length(X);

p = 0.01;
a = 0.5;
b = 3.5;
q = 0.01;
r = 1.0;
c = 1;
x_hat = 0;
x_tilde = 0;
K = [];
P = [];
X_Hat = [];
i = 1;
while i <= len
    p_tilde = a * p * a + q;
    k = (p_tilde * c) / (c * p_tilde * c + r);
    K = [K ; k];
    x_hat = x_tilde + k * (Y(i) - c * x_tilde);
    X_Hat = [X_Hat ; x_hat];
    p = (1 - k * c) * p_tilde;
    P = [P ; p];
    x_tilde = a * x_hat + b * U(i);
    i = i + 1;
end
delay = finddelay(X, X_Hat) * 0.01
figure
plot(0.01:0.01:10,[X X_Hat])
figure
plot(0.01:0.01:10,[K P])

