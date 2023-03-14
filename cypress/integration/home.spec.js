/// <reference types="cypress" />

describe('visiting the homepage', () => {

  it("displays the homepage content", () => {
    cy.visit('/').contains("Welcome to")
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})