### 1. Trim básico

``` text
derived column

id = trim(id)
nombre = trim(nombre)
```

### 2. Filtro para nulos o vacíos

``` text
filter

!isNull(id) &&
!isNull(nombre) &&
length(id) > 0 &&
length(nombre) > 0
```

### 3. Normalizar texto a minúsculas

``` text
derived column

id = lower(id)
nombre = lower(nombre)
```

### 4. Convertir id a número

``` text
derived column

id = toInteger(regexReplace(id, '[^0-9]', ''))
```

### 5. Corregir nombre

``` text
derived column

nombre = regexReplace(replace(nombre, '-', ' '),'[^a-zA-Z0-9\s]','')
```

### 6. Eliminar duplicados según nombre

``` text
aggregate

group by nombre as nombre
id = first(id)
```
