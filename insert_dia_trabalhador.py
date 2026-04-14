import json, urllib.request, urllib.error, sys

SUPABASE_URL = "https://jylvdownsghgjsxbqfxs.supabase.co"
SUPABASE_KEY = "sb_publishable_PmHqYJtwfovvVe79pUEWNA_eLFdHiBb"

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "return=representation"
}

CATALOG = [
    {
        "produto": {"nome": "Card + Moeda Personalizado", "categoria": "lembrancas", "icone": "\U0001fa99", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 2.00, "ordem": 0},
            {"label": "Acima de 50 unidades", "preco": 1.90, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + Balinha Personalizado", "categoria": "lembrancas", "icone": "\U0001f36c", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 1.80, "ordem": 0},
            {"label": "Acima de 50 unidades", "preco": 1.70, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + L\u00e1pis e Balinha Personalizado", "categoria": "utilidades", "icone": "\u270f\ufe0f", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 4.50, "ordem": 0},
            {"label": "Acima de 30 unidades", "preco": 4.30, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + Caneta Personalizado", "categoria": "utilidades", "icone": "\U0001f58a\ufe0f", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 6.50, "ordem": 0},
            {"label": "Acima de 30 unidades", "preco": 6.30, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + Chaveiro Personalizado", "categoria": "utilidades", "icone": "\U0001f5dd\ufe0f", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 6.90, "ordem": 0},
            {"label": "Acima de 30 unidades", "preco": 6.55, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + Bombom Personalizado", "categoria": "chocolates", "icone": "\U0001f36b", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 3.20, "ordem": 0},
            {"label": "Acima de 30 unidades", "preco": 3.05, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Card + Prest\u00edgio Personalizado", "categoria": "chocolates", "icone": "\U0001f36b", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 6.00, "ordem": 0},
            {"label": "Acima de 30 unidades", "preco": 5.70, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "KitKat Personalizado", "categoria": "chocolates", "icone": "\U0001f36b", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Unit\u00e1rio", "preco": 6.50, "ordem": 0},
            {"label": "Acima de 10 unidades", "preco": 6.20, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Talento Personalizado", "categoria": "chocolates", "icone": "\U0001f36b", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Unit\u00e1rio", "preco": 13.50, "ordem": 0},
            {"label": "Acima de 10 unidades", "preco": 12.80, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Mini Talento Personalizado", "categoria": "chocolates", "icone": "\U0001f36b", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Unit\u00e1rio", "preco": 6.50, "ordem": 0},
            {"label": "Acima de 10 unidades", "preco": 6.20, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Kit 3 Bis Personalizados", "categoria": "chocolates", "icone": "\U0001f36b", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 5.10, "ordem": 0},
            {"label": "Acima de 20 unidades", "preco": 4.90, "ordem": 1},
        ]
    },
    {
        "produto": {"nome": "Kit 4 Bis Personalizados", "categoria": "chocolates", "icone": "\U0001f36b", "badge": "Min. 10 un", "campanha": "dia-do-trabalhador", "ativo": True},
        "variantes": [
            {"label": "Acima de 10 unidades", "preco": 7.00, "ordem": 0},
            {"label": "Acima de 20 unidades", "preco": 6.70, "ordem": 1},
        ]
    },
]

def post(table, data):
    url = f"{SUPABASE_URL}/rest/v1/{table}"
    body = json.dumps(data, ensure_ascii=False).encode("utf-8")
    req = urllib.request.Request(url, data=body, headers=HEADERS, method="POST")
    try:
        with urllib.request.urlopen(req) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except urllib.error.HTTPError as e:
        raise Exception(f"HTTP {e.code}: {e.read().decode('utf-8')}")

print("=" * 50)
print("Inserindo produtos — Dia do Trabalhador")
print("=" * 50)

errors = []
inserted = 0

for item in CATALOG:
    nome = item["produto"]["nome"]
    try:
        result = post("produtos", item["produto"])
        # result pode ser lista ou dict dependendo do Supabase version
        prod = result[0] if isinstance(result, list) else result
        prod_id = prod["id"]

        variants = [{"produto_id": prod_id, **v} for v in item["variantes"]]
        post("variantes", variants)

        inserted += 1
        print(f"  ✓ [{prod_id}] {nome}")
    except Exception as e:
        errors.append((nome, str(e)))
        print(f"  ✗ {nome} → {e}")

print()
print(f"Resultado: {inserted}/{len(CATALOG)} produtos inseridos com sucesso.")

if errors:
    print("\nErros:")
    for nome, err in errors:
        print(f"  - {nome}: {err}")
    sys.exit(1)
