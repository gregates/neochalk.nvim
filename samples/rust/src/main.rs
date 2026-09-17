use std::collections::HashMap;
use std::fmt;

/// How many entries the report prints.
const TOP_N: usize = 3;

#[derive(Debug, Clone, PartialEq)]
enum Token<'a> {
    Word(&'a str),
    Number(f64),
}

struct Counter<'a> {
    counts: HashMap<&'a str, u32>,
    total: f64,
}

impl<'a> Counter<'a> {
    fn new() -> Self {
        Self { counts: HashMap::new(), total: 0.0 }
    }

    // Numbers are summed; everything else is counted.
    fn feed(&mut self, token: Token<'a>) {
        match token {
            Token::Word(word) => *self.counts.entry(word).or_insert(0) += 1,
            Token::Number(n) => self.total += n,
        }
    }
}

impl fmt::Display for Counter<'_> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut pairs: Vec<_> = self.counts.iter().collect();
        pairs.sort_by(|a, b| b.1.cmp(a.1));
        for (word, count) in pairs.into_iter().take(TOP_N) {
            writeln!(f, "{word:>8}\t{count}")?;
        }
        write!(f, "total = {:.2}", self.total)
    }
}

fn tokenize(line: &str) -> impl Iterator<Item = Token<'_>> {
    line.split_whitespace().map(|s| match s.parse() {
        Ok(n) => Token::Number(n),
        Err(_) => Token::Word(s),
    })
}

fn main() {
    let mut counter = Counter::new();
    for token in tokenize("yes this code 1.5 was written by claude 40") {
        counter.feed(token);
    }
    println!("{counter}");
    assert_eq!(counter.total, 41.5);
}
