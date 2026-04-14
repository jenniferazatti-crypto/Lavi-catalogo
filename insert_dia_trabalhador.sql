-- ============================================================
-- Lavi Personalizados — Produtos Dia do Trabalhador
-- Execute no Supabase > SQL Editor
-- ============================================================

-- Produto 1: Card + Moeda Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Moeda Personalizado', 'lembrancas', '🪙', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 2.00::numeric, 0), ('Acima de 50 unidades', 1.90::numeric, 1)) AS v(label, preco, ordem);

-- Produto 2: Card + Balinha Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Balinha Personalizado', 'lembrancas', '🍬', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 1.80::numeric, 0), ('Acima de 50 unidades', 1.70::numeric, 1)) AS v(label, preco, ordem);

-- Produto 3: Card + Lápis e Balinha Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Lápis e Balinha Personalizado', 'utilidades', '✏️', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 4.50::numeric, 0), ('Acima de 30 unidades', 4.30::numeric, 1)) AS v(label, preco, ordem);

-- Produto 4: Card + Caneta Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Caneta Personalizado', 'utilidades', '🖊️', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 6.50::numeric, 0), ('Acima de 30 unidades', 6.30::numeric, 1)) AS v(label, preco, ordem);

-- Produto 5: Card + Chaveiro Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Chaveiro Personalizado', 'utilidades', '🗝️', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 6.90::numeric, 0), ('Acima de 30 unidades', 6.55::numeric, 1)) AS v(label, preco, ordem);

-- Produto 6: Card + Bombom Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Bombom Personalizado', 'chocolates', '🍫', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 3.20::numeric, 0), ('Acima de 30 unidades', 3.05::numeric, 1)) AS v(label, preco, ordem);

-- Produto 7: Card + Prestígio Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Card + Prestígio Personalizado', 'chocolates', '🍫', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 6.00::numeric, 0), ('Acima de 30 unidades', 5.70::numeric, 1)) AS v(label, preco, ordem);

-- Produto 8: KitKat Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, campanha, ativo)
  VALUES ('KitKat Personalizado', 'chocolates', '🍫', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Unitário', 6.50::numeric, 0), ('Acima de 10 unidades', 6.20::numeric, 1)) AS v(label, preco, ordem);

-- Produto 9: Talento Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, campanha, ativo)
  VALUES ('Talento Personalizado', 'chocolates', '🍫', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Unitário', 13.50::numeric, 0), ('Acima de 10 unidades', 12.80::numeric, 1)) AS v(label, preco, ordem);

-- Produto 10: Mini Talento Personalizado
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, campanha, ativo)
  VALUES ('Mini Talento Personalizado', 'chocolates', '🍫', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Unitário', 6.50::numeric, 0), ('Acima de 10 unidades', 6.20::numeric, 1)) AS v(label, preco, ordem);

-- Produto 11: Kit 3 Bis Personalizados
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Kit 3 Bis Personalizados', 'chocolates', '🍫', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 5.10::numeric, 0), ('Acima de 20 unidades', 4.90::numeric, 1)) AS v(label, preco, ordem);

-- Produto 12: Kit 4 Bis Personalizados
WITH p AS (
  INSERT INTO produtos (nome, categoria, icone, badge, campanha, ativo)
  VALUES ('Kit 4 Bis Personalizados', 'chocolates', '🍫', 'Min. 10 un', 'dia-do-trabalhador', true)
  RETURNING id
)
INSERT INTO variantes (produto_id, label, preco, ordem)
SELECT p.id, v.label, v.preco, v.ordem FROM p,
(VALUES ('Acima de 10 unidades', 7.00::numeric, 0), ('Acima de 20 unidades', 6.70::numeric, 1)) AS v(label, preco, ordem);

-- ============================================================
-- Ativar campanha Dia do Trabalhador no catálogo
-- (descomente para ativar imediatamente)
-- ============================================================
-- INSERT INTO configuracoes (chave, valor)
-- VALUES ('campanha_ativa', '{"slug":"dia-do-trabalhador","nome":"Dia do Trabalhador"}')
-- ON CONFLICT (chave) DO UPDATE SET valor = EXCLUDED.valor;
