# Powershell-CryptoPRO-Convert-Keys
(RU) Скрипт умеет конвертировать закрытый ключ содержащийся в реестре Windows в формате криптопровайдера Крипто ПРО  на "флэшку" и наоборот. Автор не несет ответственности за любые последствия в результате установки и использования данного скрипта, пользователь использует его "как есть" на свой страх и риск.

(EN) The script can convert a private key contained in the Windows registry in the format of a Crypto PRO encryption provider to a flash drive and vice versa. The author is not responsible for any consequences as a result of the installation and use of this script, the user uses it "as is" at his own peril and risk.

----

Закрытые ключи криптопровайдера КриптоПРО хранятся в реестре в ветке **"HKEY_LOCAL_MACHINE\SOFTWARE\Crypto Pro\Settings\Users\\{SID}\Keys"**, 
либо **"HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Crypto Pro\Settings\Users\\{SID}\Keys"** в x64 версии ОС. 
* Структура закрытого ключа в реестре:
```
->header.key   REG_BINARY 00 00 ..
->masks.key    REG_BINARY 00 00 ..
->masks2.key   REG_BINARY 00 00 ..
->name.key     REG_BINARY 00 00 ..
->primary.key  REG_BINARY 00 00 ..
->primary2.key REG_BINARY 00 00 ..
```
* Файловая структура закрытого ключа:
```
23123213.000
->header.key
->masks.key
->masks2.key
->name.key
->primary.key
->primary2.key
```

**Usage:** 
```powershell
  Convert -Src $var1 -Dst $var2 -what $var3
  # $var1 - путь до каталога или ветки реестра откуда копируем;
  # $var2 - путь до каталога или ветки реестра куда копируем;
  # $var3 - как конвертировать {0 - из реестра в папку, 1 - из папки в реестр}.
```

**примеры:**
  
  *из реестра в папку*
```
  ./cryptopro_convert_keys.ps1 "HKLM:\SOFTWARE\Crypto Pro\Settings\Users\{SID}\Keys\test" "D:\23123213.000" 0
  -or-
  ./cryptopro_convert_keys.ps1 "HKLM:\SOFTWARE\WOW6432Node\Crypto Pro\Settings\Users\{SID}\Keys\test" "D:\23123213.000" 0
```
  *из папки в реестр*
```
  ./cryptopro_convert_keys.ps1 "D:\23123213.000" "HKLM:\SOFTWARE\Crypto Pro\Settings\Users\{SID}\Keys\test" 1
  -or-
  ./cryptopro_convert_keys.ps1 "D:\23123213.000" "HKLM:\SOFTWARE\WOW6432Node\Crypto Pro\Settings\Users\{SID}\Keys\test" 1
```
