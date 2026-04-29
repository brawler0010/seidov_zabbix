# Шаги эксперимента

1. Сбор raw SNMP-дампов с устройств.
2. Анализ доступных OID и выделение полностью/частично унифицируемых метрик.
3. Построение mapping-таблицы.
4. Создание raw SNMP item'ов в Zabbix.
5. Создание semantic calculated item'ов.
6. Проверка значений в Latest data.
7. Построение общей визуализации по `system.cpu.util` или `system.memory.util`.
8. Сравнение baseline и normalized конфигураций.
