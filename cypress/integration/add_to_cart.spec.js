describe("Navigating to website", () => {

  before(() => {
    cy.visit("/")
  })

  it("should be able to click a product", () => {
    cy.get(".products article").should("be.visible")
    cy.get("[alt='Scented Blade']").click()
    cy.contains("Scented Blade")
    cy.contains("18 in stock at")
    cy.get("[type='submit']")
      .contains("Add")
      .click()
    cy.get("[href='/cart']")
      .contains("My Cart (1)")
  })

})
