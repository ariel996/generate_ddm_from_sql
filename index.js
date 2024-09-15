const { jsPDF } = require('jspdf');
require('jspdf-autotable');
const fs = require('fs');

const parseSQLFile = (filePath) => {
    const fileContent = fs.readFileSync(filePath, 'utf-8');

    // Expression régulière pour capturer la création de tables
    const tableRegex = /CREATE TABLE `(\w+)` \(([^;]+)\)/g;
    const columnRegex = /`(\w+)` (\w+(\(\d+\))?)/g;

    const tables = [];
    let tableMatch;

    while ((tableMatch = tableRegex.exec(fileContent)) !== null) {
        const tableName = tableMatch[1];
        const tableDefinition = tableMatch[2];
        const columns = [];

        let columnMatch;
        while ((columnMatch = columnRegex.exec(tableDefinition)) !== null) {
            const columnName = columnMatch[1];
            const columnType = columnMatch[2];
            columns.push({ name: columnName, type: columnType });
        }

        tables.push({ name: tableName, columns });
    }

    return tables;
};

// Fonction pour générer un dictionnaire de données en PDF
const generateDataDictionaryPDF = (tables, outputFilePath) => {
    const doc = new jsPDF();

    doc.text("Dictionnaire de Données", 14, 20);

    tables.forEach((table, index) => {
        const tableName = table.name;
        const columns = table.columns.map(col => [col.name, col.type]);

        doc.addPage();
        doc.text(`Table: ${tableName}`, 14, 20);

        doc.autoTable({
            head: [['Nom de Colonne', 'Type de Donnée']],
            body: columns,
            startY: 30
        });
    });

    doc.save(outputFilePath);
};

// Exemple d'utilisation
const filePath = './garage.sql'; // Chemin vers le fichier SQL
const tables = parseSQLFile(filePath); // Extraire les tables et les colonnes du fichier SQL
generateDataDictionaryPDF(tables, 'dictionnaire_de_donnees.pdf'); // Générer le PDF
