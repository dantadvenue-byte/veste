# Veste v0.5 — login e sincronização opcional

## Novidades
- Tela de conta acessada pelo ícone de nuvem no topo.
- Integração opcional com Supabase Auth (criar conta, entrar e sair).
- Envio e download manual dos dados do guarda-roupa e looks para a nuvem.
- Política de segurança por usuário via Row Level Security (RLS).
- Continua funcionando localmente sem configurar uma conta.

## Para ativar a nuvem
1. Crie um projeto no Supabase.
2. Abra o SQL Editor e execute o arquivo `supabase_setup.sql`.
3. Nas configurações do projeto, copie a Project URL e a chave pública (publishable key ou anon key legada). Nunca use `service_role`/secret key no navegador.
4. Hospede os arquivos desta pasta em um site HTTPS.
5. Abra o Veste, toque no ícone de nuvem, cole a URL e a chave, e toque em “Salvar configuração”.
6. Crie uma conta ou entre. Se o projeto exigir confirmação de e-mail, confirme antes do login.
7. No primeiro dispositivo, toque em “Enviar dados à nuvem”. Em outro dispositivo, configure a mesma URL/chave, entre com a mesma conta e toque em “Baixar dados da nuvem”.

## Cuidados
- Enviar substitui os dados já existentes na nuvem para essa conta. Baixar substitui os dados locais. Faça backup JSON antes.
- A sincronização é manual nesta versão; não há mesclagem automática nem sincronização em tempo real.
- As fotos são armazenadas como imagens compactadas em base64 dentro do JSON dos dados. Para uso intenso, a próxima evolução deve mover as fotos para Supabase Storage.
- A chave pública/publishable é feita para uso no cliente, mas a segurança dos dados depende das políticas RLS. Nunca cole uma chave secreta/service_role no app.
- Não envie informações sensíveis. Use senha exclusiva e habilite as opções de segurança da conta.
- A conta e sincronização precisam de internet. O modo local continua disponível se você não configurar a nuvem.
- O pacote não foi publicado nem hospedado por mim. Ainda é necessário criar o projeto Supabase e hospedar a pasta em HTTPS.

## Testes recomendados
1. Faça backup JSON do protótipo atual.
2. Configure o Supabase e crie uma conta de teste.
3. Envie os dados; confirme que a linha apareceu em `wardrobe_data`.
4. Em outro navegador/dispositivo, entre na mesma conta e baixe os dados.
5. Teste que um usuário diferente não consegue ler a linha do primeiro usuário (RLS).
