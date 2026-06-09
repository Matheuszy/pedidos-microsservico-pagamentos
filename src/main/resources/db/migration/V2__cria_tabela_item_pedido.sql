CREATE TABLE IF NOT EXISTS item_do_pedido (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(255) DEFAULT NULL,
    quantidade INTEGER NOT NULL,
    pedido_id BIGINT NOT NULL,
    CONSTRAINT fk_item_do_pedido_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos (id) ON DELETE CASCADE
    );
)