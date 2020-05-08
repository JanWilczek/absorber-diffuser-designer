function result = square_error(var1, var2)

result = 0;
for i=1:length(var1)
    result = result + abs(var1(i) - var2(i))^2;
end;