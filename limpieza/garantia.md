### 1. Trim básico

``` text
derived column

id = trim(id)
estado = trim(estado)
```

### 2. Id como número

``` text
derived column

id = toInteger(regexReplace(id, '[^0-9]', ''))
```

### 3. Normalizar estado a minúsculas

``` text
derived column

estado = lower(estado)
```

### 4. Dar formato a la fecha

``` text
derived column

fecha = coalesce(
    toDate(fecha, 'yyyy-MM-dd'),
    toDate(fecha, 'dd-MM-yyyy'),
    toDate(fecha, 'MM-dd-yyyy'),
    toDate(fecha, 'dd/MM/yyyy'),
    toDate(fecha, 'yyyy/MM/dd'),
    toDate(fecha, 'MMM dd yyyy'),
    toDate(fecha, 'yyyy.MM.dd')
)
```

### 5. Arreglar typos en estado

``` text
derived column

estado = iif(
    regexMatch(estado, '^(pendng)$'),
    'pending',
    estado
)
```

### 6. Ordenar por id

``` text
sort

id, asc
```
