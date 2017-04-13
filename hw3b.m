input = importdata('noisy.data');
Y = input(:, 1);
X = input(:, 2);
[B,A] = butter(2, 0.1);
YY = filter(B, A, Y);
time=0.01:0.01:10;
res = [X YY];
delay = finddelay(X, YY) * 0.01
figure
plot(0.01:0.01:10, res)

