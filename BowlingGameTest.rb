  ...
  public void testGutterGame() throws Exception {
    rollMany(20, 0);
    assertEquals(0, g.score());
  }

  public void testAllOnes() throws Exception {
    rollMany(20,1);
    assertEquals(20, g.score());
  }

  public void testOneSpare() throws Exception {
    rollSpare();
    g.roll(3);
    rollMany(17,0);
    assertEquals(16,g.score());
  }

  public void testOneStrike() throws Exception {
    rollStrike();
    g.roll(3);
    g.roll(4);
    rollMany(16, 0);
    assertEquals(24, g.score());
  }

  private void rollStrike() {
    g.roll(10); 
  }

  private void rollSpare() {
    g.roll(5);
    g.roll(5);
  }
}