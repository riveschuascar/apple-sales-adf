### 1. Trim básico

``` text
derived column

id = trim(id)
cantidad = trim(cantidad)
```

### 2. Id tienda a número

``` text
derived column

id_tienda = toInteger(regexReplace(id_tienda, '[^0-9]', ''))
```

### 3. Id producto a número

``` text
derived column

id_producto = toInteger(regexReplace(id_producto, '[^0-9]', ''))
```

### 4. Convertir cantidad

``` text
cast

cantidad -> integer
```

### 5. Formatear fecha

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
