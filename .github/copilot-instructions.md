# GitHub Copilot Instructions

## Project-Specific Instructions

### Development Workflow
- **DO NOT** perform `npm run dev`. Always assume the server is running
- **DO NOT** generate summary when requests are complete
- **DO NOT** run the backend app. The app server is always running with hot reload enabled
- Use `docker logs` command to view logs in the backend app container
- For backend changes, refer to maven commands in `mvn.mk` and `app.mk` files

### Code Organization & Architecture

#### General Principles
- Follow good practices. Keep code clean and minimal
- Always use one file to define only 1 class or functional component
- Maintain clear separation of concerns

#### React Components
- All React components will primarily display the UI
- For functional logic, create a component hook named `use<Component>`
- The `use<Component>` hook will ONLY be called inside the corresponding `<Component>`
- Always use ShadCN native components and implement wrappers to enhance functionality
- **NEVER** implement custom components from scratch when ShadCN alternatives exist

#### File Structure
```
components/
├── MyComponent.tsx          # UI component
└── hooks/
    └── useMyComponent.ts    # Logic hook for MyComponent
```

## General Best Practices

### Code Quality
- Write clean, readable, and maintainable code
- Use meaningful variable and function names
- Keep functions small and focused on a single responsibility
- Follow consistent formatting and style guidelines
- Add comments for complex logic or business rules

### TypeScript/JavaScript
- Use TypeScript for type safety
- Prefer `const` over `let` when variables won't be reassigned
- Use arrow functions for consistency
- Destructure objects and arrays when appropriate
- Use optional chaining (`?.`) and nullish coalescing (`??`) operators

### React Best Practices
- Use functional components with hooks
- Extract custom hooks for reusable stateful logic
- Use `useMemo` and `useCallback` for performance optimization when needed
- Prefer composition over inheritance
- Keep components pure when possible
- Use proper key props in lists

### State Management
- Keep state as close to where it's needed as possible
- Use local state for component-specific data
- Consider context for shared state across multiple components
- Avoid prop drilling by using context or state management libraries

### Error Handling
- Implement proper error boundaries
- Handle async operations with try-catch blocks
- Provide meaningful error messages to users
- Log errors appropriately for debugging

### Performance
- Lazy load components and routes when appropriate
- Optimize bundle size by avoiding unnecessary dependencies
- Use React.memo for expensive components
- Implement proper loading states

### Accessibility
- Use semantic HTML elements
- Provide proper ARIA attributes
- Ensure keyboard navigation works
- Maintain proper color contrast
- Add alt text for images

### Testing
- Write unit tests for business logic
- Test component behavior, not implementation details
- Use descriptive test names
- Aim for good test coverage

### Git & Version Control
- Write clear, descriptive commit messages
- Keep commits focused on a single change
- Use branching strategies appropriately
- Review code before merging

### Security
- Validate user inputs
- Sanitize data before displaying
- Use environment variables for sensitive data
- Keep dependencies up to date

### Documentation
- Document complex functions and classes
- Keep README files up to date
- Use JSDoc comments for public APIs
- Document API endpoints and their expected inputs/outputs

## Technology-Specific Guidelines

### Java/Spring Boot (Backend)
- Follow Spring Boot conventions
- Use proper dependency injection
- Implement proper exception handling
- Use appropriate HTTP status codes
- Follow RESTful API design principles

### React/TypeScript (Frontend)
- Use ShadCN UI components as the foundation
- Implement proper form validation
- Handle loading and error states consistently
- Use proper TypeScript types and interfaces

### Build & Deployment
- Use the provided Makefile commands
- Follow Docker best practices
- Use proper environment configuration
- Implement health checks for services
