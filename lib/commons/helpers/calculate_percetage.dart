double calculatePercetage(int pagesRead, int totalPages) {
  if (pagesRead == 0 || totalPages == 0) return 0;
  if (pagesRead < 1) throw Exception('pagesRead não pode ser menor que 1');
  return (pagesRead / totalPages) * 100;
}
