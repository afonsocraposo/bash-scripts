const puppeteer = require('puppeteer');
const path = require("path");
const { relative } = require('path');

(async () => {

  const relativePath = process.argv[2];
  const filePath = path.resolve(relativePath);
  const filename = filePath.split("/").slice(-1)[0].split(".")[0];

  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('file://' + filePath, { waitUntil: 'networkidle2' });
  // await page.addStyleTag({ content: 'pre {page-break-before:never;page-break-after:never;page-break-inside:auto;}' })

  await page.pdf({
    path: filename + ".pdf", format: 'A4', scale: 0.8, printBackground: true,
    margin: { top: "1.5cm", bottom: "2cm", left: "1.5cm", right: "1.5cm" },
    displayHeaderFooter: true,
    headerTemplate: `<div></div>`,
    footerTemplate: `
    <div style="width: 100%; font-size: 9px; padding: 5px 5px 0; color: #bbb; text-align:center;">
        <span class="pageNumber"></span>/<span class="totalPages"></span>
    </div>
  `,
  });

  await browser.close();
})();
