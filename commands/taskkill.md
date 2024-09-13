# task killer

### linux

#### find process
```bash
ps -efl | grep 8080
```
#### kill process with pid
```bash
kill -9 pid
```

### windows

#### find process
```bash
netstat -ano | findstr 8080
```
#### kill process with pid
```bash
taskkill /F /pid pid
```

