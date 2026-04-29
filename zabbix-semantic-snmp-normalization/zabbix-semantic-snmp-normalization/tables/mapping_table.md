# Mapping table

| Semantic metric | Unified name | Alt Linux | MikroTik | Eltex vESR | Transformation |
|---|---|---|---|---|---|
| Имя узла | `asset.identity.name` | `SNMPv2-MIB::sysName.0` | `SNMPv2-MIB::sysName.0` | `SNMPv2-MIB::sysName.0` | прямое соответствие |
| Время непрерывной работы | `system.uptime` | `DISMAN-EVENT-MIB::sysUpTimeInstance` | `DISMAN-EVENT-MIB::sysUpTimeInstance` | `DISMAN-EVENT-MIB::sysUpTimeInstance` | прямое соответствие |
| Имя интерфейса | `network.interface.name` | `IF-MIB::ifDescr.{#SNMPINDEX}` | `IF-MIB::ifDescr.{#SNMPINDEX}` | `IF-MIB::ifDescr.{#SNMPINDEX}` | прямое соответствие |
| Административный статус интерфейса | `network.interface.admin_status` | `IF-MIB::ifAdminStatus.{#SNMPINDEX}` | `IF-MIB::ifAdminStatus.{#SNMPINDEX}` | `IF-MIB::ifAdminStatus.{#SNMPINDEX}` | прямое соответствие |
| Операционный статус интерфейса | `network.interface.oper_status` | `IF-MIB::ifOperStatus.{#SNMPINDEX}` | `IF-MIB::ifOperStatus.{#SNMPINDEX}` | `IF-MIB::ifOperStatus.{#SNMPINDEX}` | прямое соответствие |
| Входящий трафик | `network.interface.traffic.in.bytes` | `IF-MIB::ifInOctets.{#SNMPINDEX}` | `IF-MIB::ifInOctets.{#SNMPINDEX}` | `IF-MIB::ifInOctets.{#SNMPINDEX}` | direct / delta per second in Zabbix |
| Исходящий трафик | `network.interface.traffic.out.bytes` | `IF-MIB::ifOutOctets.{#SNMPINDEX}` | `IF-MIB::ifOutOctets.{#SNMPINDEX}` | `IF-MIB::ifOutOctets.{#SNMPINDEX}` | direct / delta per second in Zabbix |
| Загрузка CPU | `system.cpu.util` | `ssCpuIdle.0` или `hrProcessorLoad.*` | `hrProcessorLoad.*` | `ssCpuIdle.0` | `100 - idle` или `avg(hrProcessorLoad.*)` |
| Использование RAM | `system.memory.util` | `memTotalReal + memAvailReal` | `hrStorageSize + hrStorageUsed` | `memTotalReal + memAvailReal` | `(used / total) * 100` |
