# Zabbix Semantic SNMP Normalization

Репозиторий содержит артефакты эксперимента к статье
«Нормализация семантики метрик: от Vendor-specific OID к унифицированной модели данных в Zabbix».

## Состав репозитория

```text
zabbix-semantic-snmp-normalization/
├── README.md
├── zabbix_templates/
│   ├── template_raw_alt_linux_snmp.yaml
│   ├── template_raw_mikrotik_snmp.yaml
│   ├── template_raw_vesr_snmp.yaml
│   ├── template_semantic_alt.yaml
│   ├── template_semantic_mikrotik.yaml
│   └── template_semantic_vesr.yaml
├── snmp_dumps/
│   ├── alt.txt
│   ├── mikrotik.txt
│   └── vesr.txt
├── scripts/
│   └── collect_snmp.sh
├── schema/
│   ├── semantic_metrics.yaml
│   └── transformation_rules.yaml
├── tables/
│   └── mapping_table.md
└── docs/
    ├── experiment_environment.md
    ├── experiment_steps.md
    └── reproducibility.md
```

## Идея эксперимента

Эксперимент демонстрирует переход от исходных SNMP OID к унифицированным
семантическим метрикам в Zabbix. На нижнем уровне сохраняются raw SNMP item'ы,
привязанные к конкретным OID, а на верхнем уровне формируются calculated item'ы
с едиными ключами:

- `system.cpu.util`
- `system.memory.util`

## Используемые платформы

- Alt Linux + Net-SNMP
- MikroTik RouterOS
- Eltex vESR
- Zabbix Server / Frontend

## Воспроизводимость

1. Выполнить сбор SNMP-дампов скриптом `scripts/collect_snmp.sh`.
2. Импортировать raw-шаблоны Zabbix из `zabbix_templates/`.
3. Импортировать semantic-шаблоны Zabbix из `zabbix_templates/`.
4. Привязать к каждому хосту соответствующий raw- и semantic-шаблон.
5. Проверить метрики `system.cpu.util` и `system.memory.util` в Latest data.
6. Построить общий график по нормализованной метрике.

## Важно

Шаблоны являются воспроизводимыми заготовками. Перед импортом необходимо проверить:
- версию Zabbix;
- точные OID;
- индексы CPU/RAM для конкретного устройства;
- используемые SNMP community и интерфейсы.
