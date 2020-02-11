import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    #Sobre cada línea del (en total 6)
    col2 = ''
    col1 = 0
    for line in sys.stdin:
        #Para cada una vamos a sacar las dos columnas que hay 
        line = line.strip()
        splits = line.split(";")
        col2 = splits[1]
        col1 = int(splits[0])
        #Creamos el flujo de salida y a cada clave le damos valor 1
        sys.stdout.write("{},{}\n".format(col2,col1))