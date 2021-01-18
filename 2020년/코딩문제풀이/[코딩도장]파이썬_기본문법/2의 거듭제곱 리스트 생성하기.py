a,b = map(int,input().split())

result = []
for i in range(a,b+1):
    result.append(2**i)

result.pop(len(result)-2)
result.pop(1)

print(result)
