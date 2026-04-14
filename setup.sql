-- ============================================================
-- Lavi Personalizados — Script de setup do banco Supabase
-- Execute no Supabase > SQL Editor
-- ============================================================

-- 1. Adiciona coluna campanha na tabela produtos
ALTER TABLE produtos ADD COLUMN IF NOT EXISTS campanha TEXT;

-- 2. Cria tabela de categorias (caso não exista)
CREATE TABLE IF NOT EXISTS categorias (
  id      SERIAL PRIMARY KEY,
  slug    TEXT UNIQUE NOT NULL,
  nome    TEXT NOT NULL,
  icone   TEXT DEFAULT '🏷️',
  ordem   INTEGER DEFAULT 0
);

-- Insere as categorias padrão (ignora se já existirem)
INSERT INTO categorias (slug, nome, icone, ordem) VALUES
  ('quadros',    'Quadros & Fotos',    '🖼️', 1),
  ('azulejos',   'Azulejos',           '🏠', 2),
  ('canecas',    'Canecas & Bebidas',  '☕', 3),
  ('utilidades', 'Utilidades',         '🎁', 4),
  ('lembrancas', 'Lembranças',         '💝', 5),
  ('chocolates', 'Chocolates & Cards', '🍫', 6)
ON CONFLICT (slug) DO NOTHING;

-- 3. Cria tabela de configurações (chave-valor)
CREATE TABLE IF NOT EXISTS configuracoes (
  chave TEXT PRIMARY KEY,
  valor TEXT
);

-- Linha de exemplo para ativar uma campanha:
-- INSERT INTO configuracoes (chave, valor) VALUES ('campanha_ativa', '{"slug":"dia-das-maes","nome":"Dia das Mães"}')
-- ON CONFLICT (chave) DO UPDATE SET valor = EXCLUDED.valor;

-- 4. RLS: permissões leitura pública para o catálogo
ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE configuracoes ENABLE ROW LEVEL SECURITY;

CREATE POLICY IF NOT EXISTS "categorias_public_read" ON categorias
  FOR SELECT USING (true);

CREATE POLICY IF NOT EXISTS "configuracoes_public_read" ON configuracoes
  FOR SELECT USING (true);

-- Admins autenticados podem escrever
CREATE POLICY IF NOT EXISTS "categorias_auth_write" ON categorias
  FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY IF NOT EXISTS "configuracoes_auth_write" ON configuracoes
  FOR ALL TO authenticated USING (true) WITH CHECK (true);
