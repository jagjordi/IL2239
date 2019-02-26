clear thresholds
N = 5
Vref = 0.5
lsb = Vref/2^N
range = lsb:lsb:Vref-lsb;
l = length(d);
i = 1;
j = 1;
last = 0;
while(i <= l)
    if d(i) >= last
        last = d(i);
    else
        last = 0;
        thresholds(j) = Vin(i);
        i = i + 100;
        j = j + 1;
    end
    i = i + 1;
end
if length(thresholds) ~= 31
    error('Missing code')
end

dnl = max(abs(diff(thresholds) - lsb))
inl = max(abs(thresholds - range))
