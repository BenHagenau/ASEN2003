

for i = [1 4 5:8]
    file = sprintf('imp%d.csv',i);
    data = csvread(file);
    figure
    plot(data(:,1),data(:,2))
    title(file)
end