// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0

package db

import (
	"database/sql"
	"time"
)

type SimplebankAccount struct {
	ID        int64     `db:"id"`
	Owner     string    `db:"owner"`
	Balance   int64     `db:"balance"`
	Currency  string    `db:"currency"`
	CreatedAt time.Time `db:"created_at"`
}

type SimplebankEntry struct {
	ID        int64         `db:"id"`
	AccountID sql.NullInt64 `db:"account_id"`
	// can be negative or positive
	Amount    int64     `db:"amount"`
	CreatedAt time.Time `db:"created_at"`
}

type SimplebankTransfer struct {
	ID            int64         `db:"id"`
	FromAccountID sql.NullInt64 `db:"from_account_id"`
	ToAccountID   sql.NullInt64 `db:"to_account_id"`
	// can only be positive
	Amount    int64          `db:"amount"`
	Name      sql.NullString `db:"name"`
	CreatedAt time.Time      `db:"created_at"`
}