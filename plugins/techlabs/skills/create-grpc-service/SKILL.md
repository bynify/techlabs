# create-grpc-service

Create gRPC service with Protocol Buffers and proper error handling.

## When to Use
- High-performance APIs
- Microservice communication
- Streaming endpoints

## Execution

### Step 1: Define Proto
```protobuf
// api/proto/user/v1/user.proto
syntax = "proto3";
package user.v1;

service UserService {
  rpc GetUser(GetUserRequest) returns (User);
  rpc ListUsers(ListUsersRequest) returns (ListUsersResponse);
  rpc CreateUser(CreateUserRequest) returns (User);
}

message User {
  string id = 1;
  string name = 2;
  string email = 3;
}
```

### Step 2: Implement Server
```go
// internal/grpc/user.go
type UserServer struct {
    pb.UnimplementedUserServiceServer
    svc *service.UserService
}

func (s *UserServer) GetUser(ctx context.Context, req *pb.GetUserRequest) (*pb.User, error) {
    user, err := s.svc.Get(ctx, req.Id)
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "user %s not found", req.Id)
    }
    return toProto(user), nil
}
```

### Step 3: Add Interceptors
```go
func loggingInterceptor(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
    start := time.Now()
    resp, err := handler(ctx, req)
    log.Printf("gRPC %s %v %v", info.FullMethod, time.Since(start), err)
    return resp, err
}
```

## Output
- Proto definitions
- Server implementation
- Interceptors
- Client stubs
