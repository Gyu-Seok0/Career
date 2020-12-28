#urllib로 웹데이터 읽어오기!
'''
import urllib.request, urllib.parse, urllib.error

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')

counts = dict()
for line in fhand:
    #print(line.decode().strip())
    words = line.decode().split()
    for word in words:
        counts[word] = counts.get(word,0)+1
print(counts)
'''

counts = dict()
names = ['adb', 'dgs', 'adb', 'zfsfe', 'adb']
for name in names:
    counts[name] = counts.get(name,0) + 1

    #get메소드를 이용하여 키값이 있을 경우 키에 대한 값을 불러오고 없을 경우 기본값을 갖는 데이터 추가
    print(counts)
print(counts.get('adb'))
