describe('components-components: ComponentsComponents component', () => {
  beforeEach(() => cy.visit('/iframe.html?id=componentscomponents--primary'));
    
    it('should render the component', () => {
      cy.get('h1').should('contain', 'Welcome to ComponentsComponents!');
    });
});
