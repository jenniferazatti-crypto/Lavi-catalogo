-- ============================================================
-- Lavi — Deletar produtos fora da campanha 'dia-do-trabalhador'
-- Execute no Supabase > SQL Editor
--
-- PASSO 1: rode apenas o SELECT abaixo para conferir o que será deletado
-- PASSO 2: se estiver correto, rode o bloco DELETE no final
-- ============================================================


-- ============================================================
-- PASSO 1 — Prévia: quais produtos serão deletados?
-- ============================================================
SELECT
  p.id,
  p.nome,
  p.categoria,
  p.campanha,
  p.ativo,
  COUNT(v.id) AS total_variantes
FROM produtos p
LEFT JOIN variantes v ON v.produto_id = p.id
WHERE p.campanha IS NULL
   OR p.campanha != 'dia-do-trabalhador'
GROUP BY p.id, p.nome, p.categoria, p.campanha, p.ativo
ORDER BY p.categoria, p.nome;


-- ============================================================
-- PASSO 2 — DELETE (só execute após confirmar o SELECT acima)
-- Descomente o bloco abaixo quando tiver certeza
-- ============================================================

/*

-- 2a. Deleta as variantes dos produtos que serão removidos
DELETE FROM variantes
WHERE produto_id IN (
  SELECT id FROM produtos
  WHERE campanha IS NULL
     OR campanha != 'dia-do-trabalhador'
);

-- 2b. Deleta os produtos
DELETE FROM produtos
WHERE campanha IS NULL
   OR campanha != 'dia-do-trabalhador';

-- Confirmação: quantos produtos restaram
SELECT COUNT(*) AS produtos_restantes, campanha
FROM produtos
GROUP BY campanha;

*/
