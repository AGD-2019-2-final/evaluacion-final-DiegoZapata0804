import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    #Sobre cada línea del (en total 1000)
    for line in sys.stdin:
        #Para cada una vamos a sacar la columna 2 ->credit_history
        line = line.strip()
        splits = line.split(",")
        word = splits[2]
        #Creamos el flujo de salida y a cada clave le damos valor 1
        sys.stdout.write("{}\t1\n".format(word))
        