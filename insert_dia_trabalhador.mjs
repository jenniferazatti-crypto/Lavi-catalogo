const SUPABASE_URL = "https://jylvdownsghgjsxbqfxs.supabase.co";
const SUPABASE_KEY = "sb_publishable_PmHqYJtwfovvVe79pUEWNA_eLFdHiBb";

const HEADERS = {
  "apikey": SUPABASE_KEY,
  "Authorization": `Bearer ${SUPABASE_KEY}`,
  "Content-Type": "application/json",
  "Prefer": "return=representation"
};

async function post(table, data) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: "POST",
    headers: HEADERS,
    body: JSON.stringify(data)
  });
  const text = await res.text();
  if (!res.ok) throw new Error(`HTTP ${res.status}: ${text}`);
  return JSON.parse(text);
}

const CATALOG = [
  {
    produto: { nome: "Card + Moeda Personalizado", categoria: "lembrancas", icone: "🪙", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 2.00, ordem: 0 },
      { label: "Acima de 50 unidades", preco: 1.90, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Balinha Personalizado", categoria: "lembrancas", icone: "🍬", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 1.80, ordem: 0 },
      { label: "Acima de 50 unidades", preco: 1.70, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Lápis e Balinha Personalizado", categoria: "utilidades", icone: "✏️", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 4.50, ordem: 0 },
      { label: "Acima de 30 unidades", preco: 4.30, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Caneta Personalizado", categoria: "utilidades", icone: "🖊️", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 6.50, ordem: 0 },
      { label: "Acima de 30 unidades", preco: 6.30, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Chaveiro Personalizado", categoria: "utilidades", icone: "🗝️", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 6.90, ordem: 0 },
      { label: "Acima de 30 unidades", preco: 6.55, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Bombom Personalizado", categoria: "chocolates", icone: "🍫", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 3.20, ordem: 0 },
      { label: "Acima de 30 unidades", preco: 3.05, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Card + Prestígio Personalizado", categoria: "chocolates", icone: "🍫", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 6.00, ordem: 0 },
      { label: "Acima de 30 unidades", preco: 5.70, ordem: 1 },
    ]
  },
  {
    produto: { nome: "KitKat Personalizado", categoria: "chocolates", icone: "🍫", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Unitário", preco: 6.50, ordem: 0 },
      { label: "Acima de 10 unidades", preco: 6.20, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Talento Personalizado", categoria: "chocolates", icone: "🍫", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Unitário", preco: 13.50, ordem: 0 },
      { label: "Acima de 10 unidades", preco: 12.80, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Mini Talento Personalizado", categoria: "chocolates", icone: "🍫", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Unitário", preco: 6.50, ordem: 0 },
      { label: "Acima de 10 unidades", preco: 6.20, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Kit 3 Bis Personalizados", categoria: "chocolates", icone: "🍫", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 5.10, ordem: 0 },
      { label: "Acima de 20 unidades", preco: 4.90, ordem: 1 },
    ]
  },
  {
    produto: { nome: "Kit 4 Bis Personalizados", categoria: "chocolates", icone: "🍫", badge: "Min. 10 un", campanha: "dia-do-trabalhador", ativo: true },
    variantes: [
      { label: "Acima de 10 unidades", preco: 7.00, ordem: 0 },
      { label: "Acima de 20 unidades", preco: 6.70, ordem: 1 },
    ]
  },
];

console.log("=".repeat(50));
console.log("Inserindo produtos — Dia do Trabalhador");
console.log("=".repeat(50));

let inserted = 0;
const errors = [];

for (const item of CATALOG) {
  const nome = item.produto.nome;
  try {
    const result = await post("produtos", item.produto);
    const prod = Array.isArray(result) ? result[0] : result;
    const prodId = prod.id;

    const variantes = item.variantes.map(v => ({ ...v, produto_id: prodId }));
    await post("variantes", variantes);

    inserted++;
    console.log(`  ✓ [${prodId}] ${nome}`);
  } catch (e) {
    errors.push({ nome, erro: e.message });
    console.log(`  ✗ ${nome} → ${e.message}`);
  }
}

console.log();
console.log(`Resultado: ${inserted}/${CATALOG.length} produtos inseridos.`);

if (errors.length > 0) {
  console.log("\nErros encontrados:");
  errors.forEach(e => console.log(`  - ${e.nome}: ${e.erro}`));
  process.exit(1);
}
