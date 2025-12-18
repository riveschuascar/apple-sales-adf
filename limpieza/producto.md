### 1. Trim básico

``` text
derived column

id = trim(id)
notas = trim(notas)
```

### 2. Ids a números

``` text
derived column

id = toInteger(regexReplace(id, '[^0-9]', ''))
id_categoria = toInteger(regexReplace(id_categoria, '[^0-9]', ''))
```

### 3. Limpiar precio

``` text
derived column

precio = regexReplace(precio, '[^0-9]', '')
```

### 4. Arreglar precios desde notas

``` text
derived column

iif(
  !isNull(notas) &&
  length(trim(notas)) > 0 &&
  regexMatch(trim(notas), '^[0-9]'),
  concat(precio, notas),
  precio
)
```

### 5. Convertir precio a número

``` text
cast

precio -> integer
```

### 6. Filtro precios nulos

``` text
filter

!isNull(precio)
```

### 7. Formatear fechas

``` text
derived column

fecha = coalesce(
    toDate(fecha_lanzamiento, 'yyyy-MM-dd'),
    toDate(fecha_lanzamiento, 'dd-MM-yyyy'),
    toDate(fecha_lanzamiento, 'MM-dd-yyyy'),
    toDate(fecha_lanzamiento, 'dd/MM/yyyy'),
    toDate(fecha_lanzamiento, 'yyyy/MM/dd'),
    toDate(fecha_lanzamiento, 'MMM dd yyyy'),
    toDate(fecha_lanzamiento, 'yyyy.MM.dd')
)
```

### 8. Arreglar categorías nulas

``` text
derived column

id_categoria = iif(
  isNull(id_categoria) && regexMatch(lower(nombre), '.*ipod.*'),
  3,
  id_categoria
)
```
