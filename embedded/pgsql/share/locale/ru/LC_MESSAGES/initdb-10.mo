��    �      $  �   ,
      �  R   �     �  
        %  -   6  @   d  `   �  �     W   �  W   !    y  A   �  5   �  J   �     C  6   _  P   �  C   �  :   +  Q   f  5   �  ]   �  4   L  B   �  H   �  G     >   U  4   �  9   �  3     ?   7  /   w  -   �  5   �  4     >   @  y     (   �  #   "  ,   F  -   s  7   �  (   �  6     ,   9  '   f  5   �  F   �  "     <   .  &   k  -   �  -   �  !   �  1     ?   B  &   �  /   �  +   �  =     !   C  "   e  6   �  +   �     �  #     /   &  0   V  $   �  &   �     �  $   �  ~     1   �  <   �       G   "  3   j  J   �  �   �     �       �   C   �       )!  ,   J!  -   w!  !   �!     �!  J   �!  0   *"  4   ["  R   �"  K   �"  "   /#  !   R#  �   t#  d   �#     _$     p$  �   �$  O   %  R   c%  K   �%     &     &     9&  <   Q&  ;   �&  �   �&  @   ['  ;   �'    �'  u   �(  q   _)  f   �)  s   8*  &   �*     �*  t   �*  /   P+     �+  &   �+  0   �+  .   �+  )   ,  )   @,     j,     �,  &   �,  #   �,      �,  $   �,  (   $-  +   M-  "   y-     �-  "   �-  !   �-  ,   �-  $   ).  *   N.  %   y.  !   �.     �.     �.  0   �.     */     >/     F/     J/     Y/  -   k/     �/  &   �/  %   �/     0  3   $0     X0     r0  (   �0  �  �0  �   �2  9   13     k3  "   �3  W   �3  l   �3  �   i4  v  ,5  �   �6  �   d7  T  48  `   �9  @   �9  s   +:  ,   �:  Q   �:  �   ;  i   �;  X   B<  s   �<  n   =  �   ~=  N   ">  H   q>  _   �>  `   ?  `   {?  d   �?  H   A@  U   �@  j   �@  <   KA  S   �A  b   �A  x   ?B  {   �B    4C  7   KD  1   �D  a   �D  D   E  U   \E  ?   �E  h   �E  X   [F  C   �F  d   �F  �   ]G  S   �G  t   >H  ?   �H  M   �H  M   AI  9   �I  `   �I     *J  C   �J  Q   �J  M   @K  p   �K  U   �K  ;   UL  k   �L  F   �L  4   DM  >   yM  U   �M  ^   N  G   mN  P   �N  ,   O  (   3O  �   \O  {   5P  |   �P  0   .Q  ~   _Q  i   �Q  �   HR  /  �R  "   �S  (    T  }   IT  /   �T  F   �T  O   >U  8   �U      �U  �   �U  _   �V  h   �V  �   MW  �   �W  V   }X  T   �X  �   )Y  �   Z     �Z  K   �Z  �   +[  v   \  �   �\  t   ]  &   �]  :   �]  D   �]  �   0^  e   �^  �   _  �   `  h   �`  �  �`  �   �b  �   �c  �   �d  �   De  [   �e     Of    lf  p   ng     �g  V   �g  l   Sh  J   �h  G   i  G   Si  )   �i  "   �i  =   �i  ;   &j  C   bj  Q   �j  J   �j  y   Ck  ;   �k  K   �k  ?   El  S   �l  Q   �l  O   +m  i   {m  [   �m  B   An  (   �n  -   �n  Y   �n  5   5o     ko     �o     �o     �o  R   �o  H   p  Q   \p  P   �p  H   �p  j   Hq  5   �q  2   �q  c   r            r   7   *       �   �              �   �   M       j   8   K       Y      �   �      N   �   5   ~   <   p   L       f                  x              c   S   X   m   y   {           �      0   w      �       z   �   k           �   _   J       @   ,          e          1   &   �   A       �          ^   U   �   %   �   �   V   �                  :   Z                   2   W   .   �   '   -       O          �   4   �       �   g   F   �           C              B       �          ;          +   !       (   �      �   �   o                         H   �      G   T               [   s   
       d   �   >   )              ]   "          I       v   b   �       u   D       Q   \       q   �   E   h                 �      3   	      $   /                 �   =   i   l   6   }   R   9   #          P       |   �   ?   t   n   `       a       �    
If the data directory is not specified, the environment variable PGDATA
is used.
 
Less commonly used options:
 
Options:
 
Other options:
 
Report bugs to <pgsql-bugs@postgresql.org>.
 
Success. You can now start the database server using:

    %s

 
Sync to disk skipped.
The data directory might become corrupt if the operating system crashes.
 
WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.
       --auth-host=METHOD    default authentication method for local TCP/IP connections
       --auth-local=METHOD   default authentication method for local-socket connections
       --lc-collate=, --lc-ctype=, --lc-messages=LOCALE
      --lc-monetary=, --lc-numeric=, --lc-time=LOCALE
                            set default locale in the respective category for
                            new databases (default taken from environment)
       --locale=LOCALE       set default locale for new databases
       --no-locale           equivalent to --locale=C
       --pwfile=FILE         read password for the new superuser from file
   %s [OPTION]... [DATADIR]
   -?, --help                show this help, then exit
   -A, --auth=METHOD         default authentication method for local connections
   -E, --encoding=ENCODING   set default encoding for new databases
   -L DIRECTORY              where to find the input files
   -N, --no-sync             do not wait for changes to be written safely to disk
   -S, --sync-only           only sync data directory
   -T, --text-search-config=CFG
                            default text search configuration
   -U, --username=NAME       database superuser name
   -V, --version             output version information, then exit
   -W, --pwprompt            prompt for a password for the new superuser
   -X, --waldir=WALDIR       location for the write-ahead log directory
   -d, --debug               generate lots of debugging output
   -k, --data-checksums      use data page checksums
   -n, --no-clean            do not clean up after errors
   -s, --show                show internal settings
  [-D, --pgdata=]DATADIR     location for this database cluster
 %s initializes a PostgreSQL database cluster.

 %s: "%s" is not a valid server encoding name
 %s: WAL directory "%s" not removed at user's request
 %s: WAL directory location must be an absolute path
 %s: WARNING: cannot create restricted tokens on this platform
 %s: cannot be run as root
Please log in (using, e.g., "su") as the (unprivileged) user that will
own the server process.
 %s: could not access directory "%s": %s
 %s: could not access file "%s": %s
 %s: could not allocate SIDs: error code %lu
 %s: could not change permissions of "%s": %s
 %s: could not change permissions of directory "%s": %s
 %s: could not create directory "%s": %s
 %s: could not create restricted token: error code %lu
 %s: could not create symbolic link "%s": %s
 %s: could not execute command "%s": %s
 %s: could not find suitable encoding for locale "%s"
 %s: could not find suitable text search configuration for locale "%s"
 %s: could not fsync file "%s": %s
 %s: could not get exit code from subprocess: error code %lu
 %s: could not open directory "%s": %s
 %s: could not open file "%s" for reading: %s
 %s: could not open file "%s" for writing: %s
 %s: could not open file "%s": %s
 %s: could not open process token: error code %lu
 %s: could not re-execute with restricted token: error code %lu
 %s: could not read directory "%s": %s
 %s: could not read password from file "%s": %s
 %s: could not rename file "%s" to "%s": %s
 %s: could not start process for command "%s": error code %lu
 %s: could not stat file "%s": %s
 %s: could not write file "%s": %s
 %s: data directory "%s" not removed at user's request
 %s: directory "%s" exists but is not empty
 %s: encoding mismatch
 %s: failed to remove WAL directory
 %s: failed to remove contents of WAL directory
 %s: failed to remove contents of data directory
 %s: failed to remove data directory
 %s: failed to restore old locale "%s"
 %s: file "%s" does not exist
 %s: file "%s" is not a regular file
 %s: input file "%s" does not belong to PostgreSQL %s
Check your installation or specify the correct path using the option -L.
 %s: input file location must be an absolute path
 %s: invalid authentication method "%s" for "%s" connections
 %s: invalid locale name "%s"
 %s: invalid locale settings; check LANG and LC_* environment variables
 %s: locale "%s" requires unsupported encoding "%s"
 %s: must specify a password for the superuser to enable %s authentication
 %s: no data directory specified
You must identify the directory where the data for this database system
will reside.  Do this with either the invocation option -D or the
environment variable PGDATA.
 %s: out of memory
 %s: password file "%s" is empty
 %s: password prompt and password file cannot be specified together
 %s: removing WAL directory "%s"
 %s: removing contents of WAL directory "%s"
 %s: removing contents of data directory "%s"
 %s: removing data directory "%s"
 %s: setlocale() failed
 %s: superuser name "%s" is disallowed; role names cannot begin with "pg_"
 %s: symlinks are not supported on this platform
 %s: too many command-line arguments (first is "%s")
 %s: warning: specified text search configuration "%s" might not match locale "%s"
 %s: warning: suitable text search configuration for locale "%s" is unknown
 Data page checksums are disabled.
 Data page checksums are enabled.
 Encoding "%s" implied by locale is not allowed as a server-side encoding.
The default database encoding will be set to "%s" instead.
 Encoding "%s" is not allowed as a server-side encoding.
Rerun %s with a different locale selection.
 Enter it again:  Enter new superuser password:  If you want to create a new database system, either remove or empty
the directory "%s" or run %s
with an argument other than "%s".
 If you want to store the WAL there, either remove or empty the directory
"%s".
 It contains a dot-prefixed/invisible file, perhaps due to it being a mount point.
 It contains a lost+found directory, perhaps due to it being a mount point.
 Passwords didn't match.
 Rerun %s with the -E option.
 Running in debug mode.
 Running in no-clean mode.  Mistakes will not be cleaned up.
 The database cluster will be initialized with locale "%s".
 The database cluster will be initialized with locales
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 The default database encoding has accordingly been set to "%s".
 The default text search configuration will be set to "%s".
 The encoding you selected (%s) and the encoding that the
selected locale uses (%s) do not match.  This would lead to
misbehavior in various character string processing functions.
Rerun %s and either do not specify an encoding explicitly,
or choose a matching combination.
 The files belonging to this database system will be owned by user "%s".
This user must also own the server process.

 The program "postgres" is needed by %s but was not found in the
same directory as "%s".
Check your installation.
 The program "postgres" was found by "%s"
but was not the same version as %s.
Check your installation.
 This might mean you have a corrupted installation or identified
the wrong directory with the invocation option -L.
 Try "%s --help" for more information.
 Usage:
 Using a mount point directly as the data directory is not recommended.
Create a subdirectory under the mount point.
 cannot duplicate null pointer (internal error)
 caught signal
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s command not executable command not found could not change directory to "%s": %s could not close directory "%s": %s
 could not find a "%s" to execute could not get junction for "%s": %s
 could not identify current directory: %s could not look up effective user ID %ld: %s could not open directory "%s": %s
 could not read binary "%s" could not read directory "%s": %s
 could not read symbolic link "%s" could not remove file or directory "%s": %s
 could not set junction for "%s": %s
 could not stat file or directory "%s": %s
 could not write to child process: %s
 creating configuration files ...  creating directory %s ...  creating subdirectories ...  fixing permissions on existing directory %s ...  invalid binary "%s" logfile ok
 out of memory
 pclose failed: %s performing post-bootstrap initialization ...  running bootstrap script ...  selecting default max_connections ...  selecting default shared_buffers ...  selecting default timezone ...  selecting dynamic shared memory implementation ...  syncing data to disk ...  user does not exist user name lookup failure: error code %lu Project-Id-Version: initdb (PostgreSQL current)
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2019-06-17 21:30+0300
PO-Revision-Date: 2019-09-02 12:06+0300
Last-Translator: Alexander Lakhin <exclusion@gmail.com>
Language-Team: Russian <pgsql-ru-general@postgresql.org>
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 
Если каталог данных не указан, используется переменная окружения PGDATA.
 
Редко используемые параметры:
 
Параметры:
 
Другие параметры:
 
Об ошибках сообщайте по адресу <pgsql-bugs@postgresql.org>.
 
Готово. Теперь вы можете запустить сервер баз данных:

    %s

 
Сохранение данных на диск пропускается.
Каталог данных может повредиться при сбое операционной системы.
 
ПРЕДУПРЕЖДЕНИЕ: используется проверка подлинности "trust" для локальных подключений.
Другой метод можно выбрать, отредактировав pg_hba.conf или используя ключи -A,
--auth-local или --auth-host при следующем выполнении initdb.
       --auth-host=МЕТОД     метод проверки подлинности по умолчанию
                            для локальных TCP/IP-подключений
       --auth-local=МЕТОД    метод проверки подлинности по умолчанию
                            для локальных подключений через сокет
       --lc-collate=, --lc-ctype=, --lc-messages=ЛОКАЛЬ
      --lc-monetary=, --lc-numeric=, --lc-time=ЛОКАЛЬ
                            установить соответствующий параметр локали
                            для новых баз (вместо значения из окружения)
       --locale=ЛОКАЛЬ       локаль по умолчанию для новых баз
       --no-locale           эквивалентно --locale=C
       --pwfile=ФАЙЛ         прочитать пароль суперпользователя из файла
   %s [ПАРАМЕТР]... [КАТАЛОГ]
   -?, --help                показать эту справку и выйти
   -A, --auth=МЕТОД          метод проверки подлинности по умолчанию
                            для локальных подключений
   -E, --encoding=КОДИРОВКА  кодировка по умолчанию для новых баз
   -L КАТАЛОГ                расположение входных файлов
   -N, --no-sync             не ждать завершения сохранения данных на диске
   -S, --sync-only           только синхронизировать с ФС каталог данных
   -T, --text-search-config=КОНФИГУРАЦИЯ
                            конфигурация текстового поиска по умолчанию
   -U, --username=ИМЯ        имя суперпользователя БД
   -V, --version             показать версию и выйти
   -W, --pwprompt            запросить пароль суперпользователя
   -X, --waldir=КАТАЛОГ      расположение журнала предзаписи
   -d, --debug               выдавать много отладочных сообщений
   -k, --data-checksums      включить контроль целостности страниц
   -n, --no-clean            не очищать после ошибок
   -s, --show                показать внутренние установки
  [-D, --pgdata=]КАТАЛОГ     расположение данных этого кластера БД
 %s инициализирует кластер PostgreSQL.

 %s: "%s" — некорректное имя серверной кодировки
 %s: каталог WAL "%s" не был удалён по запросу пользователя
 %s: расположение каталога WAL должно определяться абсолютным путём
 %s: ПРЕДУПРЕЖДЕНИЕ: в этой ОС нельзя создавать ограниченные маркеры
 Запускать %s от имени root нельзя.
Пожалуйста, переключитесь на обычного пользователя (например,
используя "su"), который будет запускать серверный процесс.
 %s: нет доступа к каталогу "%s": %s
 %s: нет доступа к файлу "%s": %s
 %s: не удалось подготовить структуры SID (код ошибки: %lu)
 %s: не удалось поменять права для "%s": %s
 %s: не удалось поменять права для каталога "%s": %s
 %s: не удалось создать каталог "%s": %s
 %s: не удалось создать ограниченный маркер (код ошибки: %lu)
 %s: не удалось создать символическую ссылку "%s": %s
 %s: не удалось выполнить команду "%s": %s
 %s: не удалось найти подходящую кодировку для локали "%s"
 %s: не удалось найти подходящую конфигурацию текстового поиска для локали "%s"
 %s: не удалось синхронизировать с ФС файл "%s": %s
 %s: не удалось получить код выхода от подпроцесса (код ошибки: %lu)
 %s: не удалось открыть каталог "%s": %s
 %s: не удалось открыть файл "%s" для чтения: %s
 %s: не удалось открыть файл "%s" для записи: %s
 %s: не удалось открыть файл "%s": %s
 %s: не удалось открыть маркер процесса (код ошибки: %lu)
 %s: не удалось перезапуститься с ограниченным маркером (код ошибки: %lu)
 %s: не удалось прочитать каталог "%s": %s
 %s: не удалось прочитать пароль из файла "%s": %s
 %s: не удалось переименовать файл "%s" в "%s": %s
 %s: не удалось запустить процесс для команды "%s" (код ошибки: %lu)
 %s: не удалось получить информацию о файле "%s": %s
 %s: не удалось записать файл "%s": %s
 %s: каталог данных "%s" не был удалён по запросу пользователя
 %s: каталог "%s" существует, но он не пуст
 %s: несоответствие кодировки
 %s: ошибка при удалении каталога WAL
 %s: ошибка при удалении содержимого каталога WAL
 %s: ошибка при удалении содержимого каталога данных
 %s: ошибка при удалении каталога данных
 %s: не удалось восстановить старую локаль "%s"
 %s: файл "%s" не существует
 %s: "%s" - не обычный файл
 %s: входной файл "%s" не принадлежит PostgreSQL %s
Проверьте правильность установки или укажите корректный путь в параметре -L.
 %s: расположение входных файлов должно задаваться абсолютным путём
 %s: нераспознанный метод проверки подлинности "%s" для подключений "%s"
 %s: ошибочное имя локали "%s"
 %s: неверные установки локали; проверьте переменные окружения LANG и LC_*
 %s: для локали "%s" требуется неподдерживаемая кодировка "%s"
 %s: для применения метода %s необходимо указать пароль суперпользователя
 %s: каталог данных не определён.
Вы должны указать, где будут располагаться данные этой СУБД.
Это можно сделать, добавив ключ -D или установив переменную
окружения PGDATA.
 %s: нехватка памяти
 %s: файл пароля "%s" пуст
 %s: нельзя одновременно запросить пароль и прочитать пароль из файла
 %s: удаление каталога WAL "%s"
 %s: удаление содержимого каталога WAL "%s"
 %s: удаление содержимого каталога данных "%s"
 %s: удаление каталога данных "%s"
 %s: ошибка в setlocale()
 %s: имя "%s" для суперпользователя не допускается; имена ролей не могут начинаться с "pg_"
 %s: символические ссылки не поддерживаются в этой ОС
 %s: слишком много аргументов командной строки (первый: "%s")
 %s: внимание: указанная конфигурация текстового поиска "%s" может не соответствовать локали "%s"
 %s: внимание: для локали "%s" нет известной конфигурации текстового поиска
 Контроль целостности страниц данных отключён.
 Контроль целостности страниц данных включён.
 Кодировка "%s", подразумеваемая локалью, не годится для сервера.
Вместо неё в качестве кодировки БД по умолчанию будет выбрана "%s".
 Кодировка "%s" недопустима в качестве кодировки сервера.
Перезапустите %s, выбрав другую локаль.
 Повторите его:  Введите новый пароль суперпользователя:  Если вы хотите создать новую систему баз данных,
удалите или очистите каталог "%s",
либо при запуске %s в качестве пути укажите не "%s".
 Если вы хотите хранить WAL здесь, удалите или очистите каталог
"%s".
 Он содержит файл с точкой (невидимый), возможно это точка монтирования.
 Он содержит подкаталог lost+found, возможно это точка монтирования.
 Пароли не совпадают.
 Перезапустите %s с параметром -E.
 Программа запущена в режиме отладки.
 Программа запущена в режиме 'no-clean' - очистки и исправления ошибок не будет.
 Кластер баз данных будет инициализирован с локалью "%s".
 Кластер баз данных будет инициализирован со следующими параметрами локали:
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 Кодировка БД по умолчанию, выбранная в соответствии с настройками: "%s".
 Выбрана конфигурация текстового поиска по умолчанию "%s".
 Выбранная вами кодировка (%s) не совпадает с кодировкой
локали (%s). Это может привести к неправильной работе
различных функций обработки текстовых строк.
Для исправления перезапустите %s, не указывая кодировку явно, 
либо выберите подходящее сочетание параметров локализации.
 Файлы, относящиеся к этой СУБД, будут принадлежать пользователю "%s".
От его имени также будет запускаться процесс сервера.

 Программа "postgres" нужна для %s, но она не найдена
в каталоге "%s".
Проверьте правильность установки СУБД.
 Программа "postgres" найдена в "%s",
но её версия отличается от версии %s.
Проверьте правильность установки СУБД.
 Это означает, что ваша установка PostgreSQL испорчена или в параметре -L
задан неправильный каталог.
 Для дополнительной информации попробуйте "%s --help".
 Использование:
 Использовать в качестве каталога данных точку монтирования не рекомендуется.
Создайте в монтируемом ресурсе подкаталог и используйте его.
 попытка дублирования нулевого указателя (внутренняя ошибка)
 получен сигнал
 дочерний процесс завершился с кодом возврата %d дочерний процесс завершился с нераспознанным состоянием %d дочерний процесс прерван исключением 0x%X дочерний процесс завершён по сигналу %d дочерний процесс завершён по сигналу %s неисполняемая команда команда не найдена не удалось перейти в каталог "%s": %s не удалось закрыть каталог "%s": %s
 не удалось найти запускаемый файл "%s" не удалось получить связь для каталога "%s": %s
 не удалось определить текущий каталог: %s выяснить эффективный идентификатор пользователя (%ld) не удалось: %s не удалось открыть каталог "%s": %s
 не удалось прочитать исполняемый файл "%s" не удалось прочитать каталог "%s": %s
 не удалось прочитать символическую ссылку "%s" ошибка при удалении файла или каталога "%s": %s
 не удалось создать связь для каталога "%s": %s
 не удалось получить информацию о файле или каталоге "%s": %s
 не удалось записать в поток дочернего процесса: %s
 создание конфигурационных файлов...  создание каталога %s...  создание подкаталогов...  исправление прав для существующего каталога %s...  неверный исполняемый файл "%s" файл_журнала ок
 нехватка памяти
 ошибка pclose: %s выполняется заключительная инициализация...  выполняется подготовительный скрипт...  выбирается значение max_connections по умолчанию...  выбирается значение shared_buffers по умолчанию...  выбирается часовой пояс по умолчанию...  выбирается реализация динамической разделяемой памяти...  сохранение данных на диске...  пользователь не существует распознать имя пользователя не удалось (код ошибки: %lu) 