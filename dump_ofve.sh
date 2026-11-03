#!/bin/bash

OUTPUT_FILE="OFVE_PROJECT_SNAPSHOT.md"
> "$OUTPUT_FILE"

echo "# SNAPSHOT DEL PROYECTO OFVE" >> "$OUTPUT_FILE"
echo "Generado: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 1. Estructura de carpetas (ignorando build, .dart_tool, etc.)
echo "## 📂 ESTRUCTURA DE CARPETAS" >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
tree -I 'build|.dart_tool|.git|ios|android|web|linux|macos|windows|.vscode' -L 4 >> "$OUTPUT_FILE" 2>/dev/null || find . -type d -not -path '*/.*' -not -path './build/*' -not -path './.dart_tool/*' | sort >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 2. pubspec.yaml (dependencias)
echo "## 📦 PUBSPEC.YAML" >> "$OUTPUT_FILE"
echo '```yaml' >> "$OUTPUT_FILE"
cat pubspec.yaml >> "$OUTPUT_FILE"
echo '```' >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 3. Todos los archivos .dart dentro de lib/
echo "## 💻 CÓDIGO DART (lib/)" >> "$OUTPUT_FILE"
find lib -name "*.dart" -type f | sort | while read -r file; do
    echo "### 📄 $file" >> "$OUTPUT_FILE"
    echo '```dart' >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
done

# 4. Archivos SQL (si los tienes en una carpeta sql/ o supabase/)
echo "## 🗄️ ESQUEMA SQL" >> "$OUTPUT_FILE"
if [ -d "sql" ]; then
    find sql -name "*.sql" -type f | sort | while read -r file; do
        echo "### 📄 $file" >> "$OUTPUT_FILE"
        echo '```sql' >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    done
elif [ -d "supabase" ]; then
    find supabase -name "*.sql" -type f | sort | while read -r file; do
        echo "### 📄 $file" >> "$OUTPUT_FILE"
        echo '```sql' >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    done
else
    echo "*No se encontró carpeta sql/ o supabase/ con archivos .sql*" >> "$OUTPUT_FILE"
fi

echo "✅ Snapshot generado en: $OUTPUT_FILE"