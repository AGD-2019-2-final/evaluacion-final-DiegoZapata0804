import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    #Sobre cada línea del (en total 1000)
    prop=''
    monto=0
    for line in sys.stdin:
        #Para cada una vamos a sacar la columna 3 ->purpose
        #Para cada una vamos a sacar la columna 4 ->amount
        line = line.strip()
        splits = line.split(",")
        prop = splits[3]
        monto = int(splits[4])
        #Creamos el flujo de salida y a cada clave le damos valor 1
        sys.stdout.write("{};{}\n".format(prop,monto))