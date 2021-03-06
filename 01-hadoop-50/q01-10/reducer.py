import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    curkey = None
    total = 0
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)
        if key == curkey:
            ## No se ha cambiado de clave. Acá se acumulan los valores para la misma clave.
            total += val
        else:
            ## Se cambio de clave. Se reinicia el acumulador.
            ## El if pregunta si tiene algo y luego lo imprime (Si no tiene nada, es la primera vez y actualiza)
            if curkey is not None:
                ## Una vez se han reducido todos los elementos con la misma clave se imprime el resultado en
                ## el flujo de salida
                sys.stdout.write("{}\t{}\n".format(curkey, total))
            curkey = key
            total = val
    sys.stdout.write("{}\t{}\n".format(curkey, total))