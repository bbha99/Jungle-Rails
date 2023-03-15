/// <reference types="cypress" />

describe('visiting the homepage', () => {

  it("displays the homepage content", () => {
    cy.visit('/').contains("Welcome to")
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click the add to cart button of the first product", () => {
    cy.contains("My Cart (1)").should('not.exist')
    cy.get(".nav-link").contains("My Cart (0)")
    cy.get('article [action="/cart/add_item?product_id=1"] .btn').click()
    cy.get(".nav-link").contains("My Cart (1)")
  });

})