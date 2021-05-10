for relative_file_path in ./*.mdf; do
  filename=$(basename -- "$relative_file_path")
  file_path="/db_files/$filename"
  filename_without_extension="${filename%.*}"
  log_file_path="/db_files/"$filename_without_extension"_log.ldf"
  /opt/mssql-tools/bin/sqlcmd -S . -U sa -P $SA_PASSWORD \
    -Q "CREATE DATABASE [$filename_without_extension] ON (FILENAME = '$file_path'),(FILENAME = '$log_file_path') FOR ATTACH"
done
