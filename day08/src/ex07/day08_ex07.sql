-- session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 1
UPDATE pizzeria SET rating = 3.14 WHERE id = 1;

-- session 2
UPDATE pizzeria SET rating = 1.6 WHERE id = 2;

-- session 1
UPDATE pizzeria SET rating = 3.14 WHERE id = 2;

-- session 2
UPDATE pizzeria SET rating = 1.6 WHERE id = 1;

-- session 1
COMMIT;

-- session 2
COMMIT;