-- ============================================================
-- Lavi — Migração: campanha única → múltiplas campanhas ativas
-- Execute no Supabase > SQL Editor
-- ============================================================

DO $$
DECLARE
  old_val  text;
  new_exists boolean;
BEGIN
  -- Verifica se existe o formato antigo (campanha_ativa)
  SELECT valor INTO old_val FROM configuracoes WHERE chave = 'campanha_ativa';

  -- Verifica se o novo formato já existe
  SELECT EXISTS(SELECT 1 FROM configuracoes WHERE chave = 'campanhas_ativas') INTO new_exists;

  IF old_val IS NOT NULL AND NOT new_exists THEN
    -- Migra: envolve o objeto único em array
    INSERT INTO configuracoes (chave, valor)
    VALUES ('campanhas_ativas', json_build_array(old_val::json)::text);
    RAISE NOTICE 'Migrado: campanha_ativa → campanhas_ativas (array com 1 item)';

  ELSIF NOT new_exists THEN
    -- Nenhuma campanha existia — cria array vazio
    INSERT INTO configuracoes (chave, valor)
    VALUES ('campanhas_ativas', '[]');
    RAISE NOTICE 'Criado: campanhas_ativas com array vazio';

  ELSE
    RAISE NOTICE 'campanhas_ativas já existe — nenhuma alteração necessária';
  END IF;

  -- Remove chave antiga
  DELETE FROM configuracoes WHERE chave = 'campanha_ativa';
  RAISE NOTICE 'Removido: campanha_ativa (se existia)';
END $$;

-- Verificação: mostra o estado final
SELECT chave, valor FROM configuracoes WHERE chave = 'campanhas_ativas';
