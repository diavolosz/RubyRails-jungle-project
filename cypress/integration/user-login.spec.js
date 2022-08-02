describe("Navigating to website", () => {

  before(() => {
    cy.visit("/")
  })

  it("should allow user to log in and log out", () => {
    cy.contains("Log in").click()
    cy.get("[id='email']").type("test@gmail.com")
    cy.get("[id='password']").type("aaaaaaaa")
    cy.contains("Submit").click()
    cy.contains("Log out").should("exist")
    cy.contains("Log out").click()
    cy.contains("Log in").should("exist")
  })

})
