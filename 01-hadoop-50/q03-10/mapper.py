import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    #Sobre cada línea del (en total 6)
    col1 = ''
    col2 = 0
    for line in sys.stdin:
        #Para cada una vamos a sacar las dos columnas que hay 
        line = line.strip()
        splits = line.split(",")
        col1 = splits[0]
        col2 = int(splits[1])
        #Creamos el flujo de salida y a cada clave le damos valor 1
        sys.stdout.write("{};{}\n".format(col2,col1))