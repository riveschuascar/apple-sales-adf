### 1. Trim básico

``` text
derived column

id = trim(id)
nombre = trim(nombre)
ciudad = trim(ciudad)
pais = trim(pais)
inaguracion = trim(inaguracion)
```

### 2. Separar nombres por coma

``` text
split

condición: instr(nombre, ',') < 3
salidas: normal / roto
```

### 3. Reconstruir filas

``` text
derived column

partes = split(nombre, ',')
```

### 4. Asignar columnas

``` text
derived column

nombre = partes[1]
ciudad = partes[2]
pais = partes[3]
inaguracion = partes[4]
```

### 5. Unir filas

``` text
union

byName = true
```

### 6. Id a número

``` text
derived column

id = toInteger(regexReplace(id, '[^0-9]', ''))
```

### 7. Limpiar texto

``` text
derived column

nombre = regexReplace(nombre, '[^A-Za-z\s]', '')
ciudad = regexReplace(ciudad, '[^A-Za-z\s]', '')
pais = regexReplace(pais, '[^A-Za-z\s]', '')
```

### 8. Reemplazar O por 0

``` text
derived column

inaguracion = regexReplace(inaguracion, 'O', '0')
```

### 9. Convertir inauguración

``` text
cast

inaguracion -> integer
```

### 10. Reemplazar nulos

``` text
derived column

inaguracion = iif(
  isNull(inaguracion),
  0,
  inaguracion
)
```

### 11. Filtrar nombres nulos

``` text
filter

!isNull(nombre) && nombre != ''
```

### 12. Ordenar por id

``` text
sort

asc(id)
```
