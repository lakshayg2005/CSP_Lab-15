#!/bin/bash

# Define input CSV file and output LaTeX file
input_file="heart.csv"
output_file="q2.tex"

# Start the LaTeX table environment
echo "\documentclass{article}" > "$output_file"
echo "\begin{document}" > "$output_file"

echo "\\begin{table}[ht]" > "$output_file"
echo "\\centering" >> "$output_file"
echo "\\begin{tabular}{|$(head -1 "$input_file" | sed 's/[^,]*/c/g' | sed 's/,/|/g')|}" >> "$output_file"
echo "\\hline" >> "$output_file"

# Print the header row (replace commas with ampersands, add LaTeX line ending)
head -1 "$input_file" | sed 's/,/ \& /g' >> "$output_file"
echo " \\\\ \\hline" >> "$output_file"

# Print each data row in the same way
tail -n +2 "$input_file" | while IFS= read -r line; do
    echo "$line" | sed 's/,/ \& /g' >> "$output_file"
    echo " \\\\" >> "$output_file"
done

# End the table
echo "\\hline" >> "$output_file"
echo "\\end{tabular}" >> "$output_file"
echo "\\caption{Heart Disease Data Table}" >> "$output_file"
echo "\\label{tab:heart_disease_data}" >> "$output_file"
echo "\\end{table}" >> "$output_file"
echo "\begin{document}" >> "$output_file"


